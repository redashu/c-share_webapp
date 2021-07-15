FROM ubuntu 
RUN apt update ; apt install wget -y 
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt update 
RUN apt-get install -y apt-transport-https
RUN apt update 
RUN  apt-get install -y dotnet-sdk-3.1 
RUN mkdir /mycode
COPY .  /mycode/
WORKDIR  /mycode
RUN dotnet build 
EXPOSE 5000
# to create .dll file above step is required 
CMD ["dotnet","run","--urls","http://0.0.0.0:5000"]

