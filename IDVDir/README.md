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
```
