- Clone this repo
```
git clone --recursive git@github.com:joemasterjohn/idvjs.git
```
If already cloned without the TPTP antlr submodule:
```
git submodule update --init
```

- How to build:
```bash
npm install
cd TPTP-ANTLR4-Grammar
antlr4 -Dlanguage=JavaScript tptp_v7_0_0_0.g4
webpack
```

- How to setup with Apache using mod-wsgi.
mod-wsgi works better if python is compiled using the --enable-shared flag:

So inside this repo (IDVDir), run the following (modifying paths where necessary):
```bash
wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
tar -zxvf Python-3.7.5.tgz

cd Python-3.7.5
./configure --prefix=/home/tptp/ServiceTools/IDVDir/IDVPython --enable-shared --enable-optimizations LDFLAGS="-Wl,--rpath=/home/tptp/ServiceTools/IDVDir/IDVPython/lib"
make
make install
```

At this point, IDV will be installed at the path you specified for `--prefix` and you can run the python binary under the bin subdirectory.
You should also be able to remove the `Python-3.7.5.tgz` file and `Python-3.7.5` folder used for building.
Then you can install flask and mod-wsgi using `/home/tptp/ServiceTools/IDVDir/IDVPython/bin/python -m pip install flask mod-wsgi`.
Once these are installed, you can symlink the `idv.conf` file into the `/etc/httpd/conf.d` apache config folder and `wsgi.conf` into the `/etc/httpd/conf.modules.d` apache config folder.


