## 2018.5.10更新说明
感谢知乎网友@孤独子狮 指出QImage处需要考虑内存对齐的问题。因为本人缺乏跨平台、图形库开发经验，所以在调试成功后就没有深入探究。
主要修改了QImage的构造方式，使用了指定bytesPerLine的构造函数，具体原因参见：https://www.zhihu.com/question/38594052/answer/387891545

## Qt使用Mupdf案例
一个使用Qt调用Mupdf的案例，代码是根据Mupdf提供的example.c改写。
具体使用建议参看Mupdf提供的源代码，或者参考（这个代码时间长了会编译报错）
https://github.com/xiangxw/mupdf-qt

## 使用版本
Mupdf1.12.0+Qt5.9.3+vs2015

## 原文地址
http://www.cnblogs.com/blueroses/p/8268217.html

## 知乎地址
https://www.zhihu.com/question/38594052/answer/296672967
