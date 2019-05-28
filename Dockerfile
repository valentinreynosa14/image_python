From ubuntu 
RUN  apt update 
RUN  apt install wget -y && apt install git -y && apt install iputils-ping -y
RUN  echo 1.0 >> /etc/version 

##WORKDIR##
RUN  mkdir /datos
WORKDIR /datos 
RUN touch f1.txt 
RUN mkdir /datos1
WORKDIR /datos1 
RUN touch f2.txt

##COPY##
COPY index.html .
COPY app.log /datos  

##ADD##
ADD docs docs 
ADD f* /datos/
ADD f.tar . 

##ENV##
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

##ARG##
#ARG dir3
#RUN mkdir $dir3

#ARG user  
#ENV user docker $user 
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh 

##EXPOSE##
RUN apt install -y apache2 
EXPOSE 80
ADD entrypoint.sh /datos1

##VOLUME##
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

##CMD##
CMD /datos1/entrypoint.sh 

##ENTRYPOINT##
#ENTRYPOINT ["/bin/bash"]

#CMD ["echo", "Welcome this container"]
#CMD /bin/bash
#CMD ["/bin/bash"]
#ENTRYPOINT ["df"]
