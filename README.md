# futu-opend-docker

This docker image dockerized the FutuOpenD Ubuntu version in this page: https://www.futunn.com/download/OpenAPI

# Support 
* _**Python <=3.7**_

# Usage

* All CLI params in the link below can be added as a docker run command 
  https://openapi.futunn.com/futu-api-doc/opend/opend-cmd.html
  
  e.g. `-login_account={FUTU_ACCOUNT_ID} -login_pwd={FUTU_ACCOUNT_PWD}`
  

* You can define the port mapping for 11111(API) and 22222(Telnet control)
  

* **Required for trade API:**
  
    Mount an RSA key file to `/home/rsa` to enable the encryption mode 
  
    (**Currently DO NOT SUPPORT Python 3.8,  will return "RSA key is invalid"**)
  

* First time login will trig SMS verification code, you have to use telnet to input the code:
  1. `telnet 127.0.0.1 {TELNET_PORT}`
  2. `input_phone_verify_code -code={SMS_CODE}`
  3.  `^]` and quit
  

* Suggest to mount the data folder to `/root/.com.futunn.FutuOpenD/F3CNN/` to avoid the future SMS verification


# Example:
    docker run -d -p {API_PORT}:11111 -p {TELNET_PORT}:22222 -v {ABS_PATH_TO_RSA_FILE}:/home/rsa -v {ABS_PATH_TO_DATA_FOLDER}:/root/.com.futunn.FutuOpenD/F3CNN/ harrychiu/futu-opend -login_account={FUTU_ACCOUNT_ID} -login_pwd={FUTU_ACCOUNT_PWD}
