# futu-opend-docker

This docker image dockerized the FutuOpenD Ubuntu version in this page: https://www.futunn.com/download/OpenAPI

# Usage

* All CLI params in the link below can be added as a docker run command 
  https://openapi.futunn.com/futu-api-doc/opend/opend-cmd.html
* You can define the port mapping for 11111(API) and 22222(Telnet control)
* Mount an RSA key file to enable the encryption mode (Currently API side returns "RSA key is invalid")
* First time login will trig SMS verification code, you have to use telnet to input the code:
  1. telnet 127.0.0.1 {Your port mapping for 22222}
  2. input_phone_verify_code -code={SMS Code}
  3.  ^] and quit
* Suggest to mount the data folder to avoid the future SMS verification

* Example:
docker run -d -p 8011:11111 -p 8023:22222 -v {ABS_PATH_RSA_KEY}:/home/rsa -v
  {DATA_FOLDER}:/root/.com.futunn.FutuOpenD/F3CNN/ harrychiu/futu-opend -login_account={ACCOUNT_ID} -login_pwd={ACCOUNT_PWD}