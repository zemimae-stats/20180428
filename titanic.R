# データのインポート ---------------------------------------------------------------
## この操作は右上の「import Dataset」アイコンから可能。
library(readxl)
titanic_data <- read_excel("./titanic.xlsx")
View(titanic_data)

# Importしたデータをコピーしてオリジナルを保存------------------------------------------
d = titanic_data

# データの構造を見る ---------------------------------------------------------------
str(d)

# 必要な説明変数を因子化 -------------------------------------------------------------
d$gender = as.factor(d$gender)
d$age = as.numeric(d$age)
d$passengerClass = as.factor(d$passengerClass)

str(d) # ちゃんと変換できたかチェック

# ロジスティック回帰 ---------------------------------------------------------------
kekka <- glm(survived ~ gender + age + passengerClass, data=d, family=binomial)
summary(kekka)


exp(coef(kekka)) #オッズ比
exp(confint(kekka)) #オッズ比の95%信頼区間


# 別の方法でオッズ比を確認 -----------------------------------------------------------------
install.packages("epiDisplay") # インストールしてなければインストールする
library(epiDisplay) # 使えるようにロードする

logistic.display(kekka) # オッズ比を確認

##########
#参考文献
#https://researchmap.jp/jomk5xr2p-1781589/
##########