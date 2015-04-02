if [ -d ${HOME}/Android/Sdk ]; then
    export ANDROID_HOME=${HOME}/Android/Sdk
elif [ -d /usr/local/opt/android-sdk ]; then
    export ANDROID_HOME=/usr/local/opt/android-sdk
elif [ -d /Developer/android-sdk-macosx ]; then
    export ANDROID_HOME=/Developer/android-sdk-macosx
fi

if [ ! -z $ANDROID_HOME ]; then
    path+=(${ANDROID_HOME}/tools)
    path+=(${ANDROID_HOME}/platform-tools)
fi


