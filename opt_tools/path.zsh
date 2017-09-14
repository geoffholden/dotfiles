if [ -d /opt/tools ]; then
    for dir in /opt/tools/*; do
        if [ -d $dir ]; then
            if [ -d $dir/bin ]; then
                path+=(${dir}/bin)
            fi
            path+=(${dir})
        fi
    done
fi

