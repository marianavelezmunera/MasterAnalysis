# Environment 

#Data

variables<-metadatos_hongos[1:34,c(-6:-16)]
variables$Altitud<-as.numeric(variables$Altitud)
variables<-variables[,c(-6,-8,-10)]
colnames(variables)[6]<-"Temp"
colnames(variables)[8]<-"HR"
colnames(variables)[7]<-"Luz"

#Heat plot

correlaciones<-cor(variables[,5:23],method = "pearson")

correlaz<-melt(correlaciones)
rownames(correlaciones)<-colnames(correlaciones)

correlaz<-correlaz[-c(20,39,58,77,96,115,134,153,172,191,210,229,248,267,286,305,324,343,40,59,78,97,116,135,154,173,192,211,230,249,268,287,306,325,344,60,79,98,117,136,155,174,193,212,231,250,269,288,307,326,345,80,99,118,137,156,175,194,213,232,251,270,289,308,327,346,100,119,138,157,176,195,214,233,252,271,290,309,328,347,120,139,158,177,196,215,234,253,272,291,310,329,348,140,159,178,197,216,235,254,273,292,311,330,349,160,179,198,217,236,255,274,292,312,331,350,180,199,218,237,256,275,294,313,332,351,200,219,238,257,276,295,314,333,352,220,239,258,277,296,315,334,353,293,240,259,278,297,316,335,354,260,279,298,317,336,355,280,299,318,337,356,300,319,338,357,320,339,358,340,359,360),]


ggplot(data=correlaz,aes(x=Var1,y=Var2,fill=value))+
  geom_tile(color = "white",
            lwd = 1.5,
            linetype = 1)+
  coord_fixed()+
  theme_pubclean()+
  theme(axis.title = element_blank())+
  theme(legend.position = "right")+
  scale_fill_gradientn(name="Correlación",colors = met.brewer("Pissaro",6))+
  theme(axis.text.x = element_text(angle = 45))
ggsave("heatplot.png",last_plot())

# Cortest variable vs elevation

cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$T_prom_jul)

cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$HR_prom_jul) 
cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$pH)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Luz_prom_jul)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$MO)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$N)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ptotal)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$CE)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$NO3)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Fe)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$K)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$NH4)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ctotal)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$CIC)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ca)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Mg)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Na)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$P)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ctotal)
#ANOVAs per elevation

summary(aov(T_prom_jul~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(HR_prom_jul~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(Luz_prom_jul~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(pH~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(CE~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(MO~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(N~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(Ptotal~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(K~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(NO3~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(NH4~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(Fe~Altitud,data=metadatos_hongos[1:34,]))
summary(aov(CIC~Altitud,data=metadatos_hongos[1:34,]))

# Plots

ggtheme_config<-list(
  theme_biome_utils(),
  xlab("Elevation"),
  scale_fill_manual(name="Elevation",values=colores),
  theme(legend.position = "none"))

a<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=T_prom_jul,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Temperature (C°)")
a
b<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=HR_prom_jul,fill=Altitud))+
  geom_point(color="black",size=0.5)+
  ggtheme_config+
  ylab("Relative humidity (%)")

c<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Luz_prom_jul,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Light (lux)")
d<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=pH,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
e<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=CE,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("EC")+
  ggtheme_config

g<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=N,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
h<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Ptotal,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("Total phosphorus")+
  ggtheme_config
i<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=K,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
j<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=NO3,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
k<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=NH4,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
l<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Fe,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config

ambiente<-a+b+c+d+e+g+h+i+j+k+l
ambiente
