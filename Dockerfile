FROM ubuntu
RUN apt-get update -y && apt-get install nginx -y && apt-get install vim -y && apt-get install unzip -y && apt-get install curl -y && apt-get install wget -y && apt-get install git -y 
RUN mkdir /code
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/adisharma96/jenkins-poc.git /code
WORKDIR /code/
RUN cp -r *  /var/www/html/
EXPOSE 80
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
