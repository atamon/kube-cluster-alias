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
git clone https://github.com/atamon/kube-cluster-alias $HOME/kube-cluster-alias

# Cleans the evil that is a default cluster
echo "" > $HOME/.kube/config
# Make it read-only (except for root :)
chmod 400 $HOME/.kube/config

# List your available clusters:
gcloud container clusters list

# Example output, edit name and zone to your configuration
# NAME          ZONE            MASTER_VERSION  MASTER_IP       MACHINE_TYPE   NODE_VERSION  NUM_NODES  STATUS
# LEGACY        ZONE-A          ...
# PROD          ZONE-B          ...

# Create two new configuration files:
# Assuming you're working with two clusters "legacy" and "production"
KUBECONFIG=$HOME/legacy-config gcloud container clusters get-credentials LEGACY --zone=ZONE-A
KUBECONFIG=$HOME/prod-config gcloud container clusters get-credentials PROD --zone=ZONE-B
```

### Fish Shell
```sh
# Append to ~/.config/fish/config.sh
# Requires you to do have bass installed!
echo "bass '$HOME/kube-cluster-alias/source.sh' $HOME/.kube | source" >> ~/.config/fish/config.fish
```

### Bash
```sh
# Adjust path to your git clone of course
echo 'eval "$($HOME/kube-cluster-alias/source.sh $HOME/.kube)"' >> ~/.bash_profile
```
