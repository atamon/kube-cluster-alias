# kube-cluster-alias
Because scripts running kubectl are scary as sh*t

## Requirements

Depends on `jq` (https://stedolan.github.io/jq/) to get the namespaces. (Yeah I guess this should be done without a dependency :) )

## Usage

```sh
k-{suffix}-{namespace} get pods # etc ...

# Example
k-test get pods --all-namespaces
k-test-namespace1 get pods
```

## Setup

### Generic
```sh
export HOME=/home/user

# Cleans the evil that is a default cluster
echo "" > $HOME/.kube/config
# Make it read-only (except for root :)
chmod 400 $HOME/.kube/config

# Create two new configuration files:
# Assuming you're working with two clusters "legacy" and "production"
KUBECONFIG=/home/user/legacy-config gcloud container clusters get-credentials <legacy-cluster>
KUBECONFIG=/home/user/prod-config gcloud container clusters get-credentials <prod-cluster>
```

### Fish Shell
```sh
# Append to ~/.config/fish/config.sh
# Requires you to do have bass installed!
echo "bass './kube-cluster-alias/source.sh' $HOME/.kube | source" >> ~/.config/fish/config.fish
```

### Bash
```sh
# Adjust path to your git clone of course
echo 'eval "$(./kube-cluster-alias/source.sh $HOME/.kube)"' >> ~/.bash_profile
```
