#include "widget.h"
#include "ui_widget.h"
#include <QMessageBox>
#include <QDebug>
#include <QImage>
#include <QPixmap>
#include <QLabel>

#include "mupdf/fitz.h"
#include "mupdf/pdf.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);

    char *input = const_cast< char* >("document.pdf");
    float zoom, rotate;
    int page_number, page_count;
    fz_context *ctx;
    fz_document *doc;
    fz_pixmap *pix;
    fz_matrix ctm;

    //第一页为0
    page_number=0;
    //100%缩放比
    zoom=100;
    //旋转为0
    rotate=0;

    //创建上下文
    ctx = fz_new_context(NULL, NULL, FZ_STORE_UNLIMITED);
    if (!ctx)
    {
        qDebug()<<stderr<<"cannot create mupdf context";
        return;
    }

    //注册文档控制
    fz_try(ctx)
            fz_register_document_handlers(ctx);
    fz_catch(ctx)
    {
        qDebug()<<stderr<<"cannot register document handlers:"<< fz_caught_message(ctx);
        fz_drop_context(ctx);
        return;
    }

    //打开文档
    fz_try(ctx)
        doc = fz_open_document(ctx, input);
    fz_catch(ctx)
    {
        qDebug()<<stderr<< "cannot open document:"<< fz_caught_message(ctx);
        fz_drop_context(ctx);
        return;
    }

    //取得总的页数
    fz_try(ctx)
        page_count = fz_count_pages(ctx, doc);
    fz_catch(ctx)
    {
        qDebug()<<stderr<< "cannot count number of pages:"<< fz_caught_message(ctx);
        fz_drop_document(ctx, doc);
        fz_drop_context(ctx);
        return;
    }

    if (page_number < 0 || page_number >= page_count)
    {
        qDebug()<<stderr<< "page number out of range: "<< page_number + 1<<"page count:"<<page_count;
        fz_drop_document(ctx, doc);
        fz_drop_context(ctx);
        return;
    }

    //计算缩放以及旋转
    fz_scale(&ctm, zoom / 100, zoom / 100);
    fz_pre_rotate(&ctm, rotate);

    //渲染pixmap
    fz_try(ctx)
        pix = fz_new_pixmap_from_page_number(ctx, doc, page_number, &ctm, fz_device_rgb(ctx), 0);
    fz_catch(ctx)
    {
        qDebug()<<stderr<< "cannot render page: %s\n"<< fz_caught_message(ctx);
        fz_drop_document(ctx, doc);
        fz_drop_context(ctx);
        return;
    }

    //渲染成图片
//   unsigned char *samples = fz_pixmap_samples(ctx, pix);
       unsigned char *samples = pix->samples;
   int width = fz_pixmap_width(ctx, pix);
   int height = fz_pixmap_height(ctx, pix);
   QImage image(samples, width, height,pix->stride,QImage::Format_RGB888);
   QLabel *label=new QLabel;
   label->setPixmap(QPixmap::fromImage(image));

   ui->layout->addWidget(label);

//   if (!image.save("a.png")) {
//       return;
//   }

    //回收内存
    fz_drop_pixmap(ctx, pix);
    fz_drop_document(ctx, doc);
    fz_drop_context(ctx);
}

Widget::~Widget()
{
    delete ui;
}
