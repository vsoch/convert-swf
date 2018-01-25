# swf to mp4

This is a tiny Docker container to convert an old compressed flash (swf) to mp4.
To build, you can do the following:

```
docker build -t vanessa/convert-swf .
```

And then to run, the container expects an input swf file as first argument, and
an mp4 argument as the second. We do everything in a `/data` directory that we map on the host.

```
docker run vanessa/convert-swf input.swf output.mp4
```

If you have a folder of old swf, here is how you might convert them!

```
for swfile in $(ls *.swf)
    do
    echo "Converting $swfile!"
    docker run -v $PWD:/data vanessa/convert-swf:latest /data/$swfile
done

```
Happy converting!
