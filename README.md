# centos7-test
Centos7 compatibility tests

```
git clone https://github.com/Nenime/centos7-test.git
cd centos7-test
find . -name "*.sh" -exec chmod +x {} \;
mkdir -p output
./<test_name>.sh
```
Перед перезапуском тестов:
```
rm -r output/*
```

