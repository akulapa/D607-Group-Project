
if (!require("stringr")) install.packages('stringr')
if (!require("readr")) install.packages('readr')
library(readr)
library(stringr)


url2='paysa.txt'
mystring = read_file(url2)
mystring


cline=str_extract_all(mystring,".*?APPLY NOW\\n(.*?).*",simplify = TRUE)
cline=data.frame(cline)
cline=t(cline)

Base=str_extract_all(mystring,".*?Base Salary(.*?).*",simplify = TRUE)
Base=data.frame(Base)
Base=t(Base)
revalue(Base$V1, c("Base Salary"=""))

Annual=str_extract_all(mystring,".*?Annual Bonus(.*?).*",simplify = TRUE)
Annual=data.frame(Annual)
Annual=t(Annual)

signing=str_extract_all(mystring,".*?Signing Bonus(.*?).*",simplify = TRUE)
signing=data.frame(signing)
signing=t(signing)

skillset=str_extract_all(mystring,".*?You can learn valuable new skills like:(.*?).*",simplify = TRUE)
skillset=data.frame(skillset)
skillset=t(skillset)

expected=str_extract_all(mystring,".*?EXPECTED\\n(.*?).*",simplify = TRUE)
expected=data.frame(expected)
expected=t(expected)

location=str_extract_all(mystring,"Jobs in(.*?).*",simplify = TRUE)
location=data.frame(location)
location=t(location)

salary=data.frame()
salary=data.frame(1:390,expected,Base,Annual,signing)
