# swf to mp4

This is a tiny Docker container to convert an old compressed flash (swf) to mp4.
To build, you can do the following:

```bash
docker build -t vanessa/convert-swf .
```

And then to run, the container expects an input swf file as first argument, and
will generate an mp4 file named equivalently with a different extension. 
We do everything in a `/data` directory that we map on the host.

```bash
docker run -v ${PWD}/:/data vanessa/convert-swf filename.swf
```

If you have a folder of old swf, here is how you might convert them!

```bash
for swfile in $(ls *.swf)
    do
    echo "Converting $swfile!"
    docker run -v $PWD:/data vanessa/convert-swf /data/$swfile
done
```
Happy converting!
