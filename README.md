# kube-cluster-alias
For when you work in several clusters at the same time and tend to get sloppy
# Usage

## Fish Shell
```sh
# Constructa  ./clusters.txt file containing your clusters as "cluster-name:suffix"
echo "my-prod-cluster:prod" >> ./kube-cluster-alias/clusters.txt
echo "my-test-cluster:test" >> ./kube-cluster-alias/clusters.txt

# Append to ~/.config/fish/config.sh
# Requires you to do have bass installed!
bass '/full/path/to/kube-cluster-alias/source.sh' | source

# Open a new terminal and:
k-test get pods --all-namespaces
k-test-namespace1 get pods
# ... and so on
```

## Bash
The same as above, but just source the file directly I guess :)