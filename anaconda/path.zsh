if [ -d /Developer/anaconda/bin ]; then
    path=("/Developer/anaconda/bin" $path)
elif [ -d /Volumes/Data/Developer/anaconda/bin ]; then
    path=("/Volumes/Data/Developer/anaconda/bin" $path)
elif [ -d /opt/tools/anaconda2/bin ]; then
    path=("/opt/tools/anaconda2/bin" $path)
fi


