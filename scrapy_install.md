## windows下scripy框架的安装（2017-10-30 周一）

1.安装python 2.7

https://www.python.org/downloads/

2.设置环境变量

添加到path中C:\Python2.7\;C:\Python2.7\Scripts；

进一步修改:重新打开命令行：运行

```
c:\python27\python.exe c:\python27\tools\scripts\win_add2path.py
```

3.验证是否装好

python --version

4.python2.7.09以上自带pip

pip --version

5.安装Scrapy

```
pip install Scrapy
```