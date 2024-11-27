mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Automatically do an ls after each cd, z, or zoxide
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && eza -al --group-directories-first --icons
	else
		builtin cd ~ && eza -al --group-directories-first --icons
	fi
}


alias whatismyip="whatsmyip"
function whatsmyip () {
	echo -n "External IP: "
	curl -s ifconfig.me
}

# Git
gcom() {
	git add .
	git commit -m "$1"
}

lazyg() {
	git add .
	git commit -m "$1"
	git push
}



function kpods() {
    kubectl --kubeconfig=$HOME/.kube/$1 get pods | grep $2 | awk '{print "Pod: " sprintf("%-50s", $1) " - Status: " sprintf("%-15s", $3) " - Age: " $5}'
}

function kexec() {
    echo "Trying to exec pod like: $2"
    podname=$(kubectl --kubeconfig=$HOME/.kube/$1 get pods | grep $2 | awk 'NR==1{print $1}')
    if [ -z "$podname" ]
    then
        echo "Could not find any pods for: $2"
    else
        echo "Found a pod: $podname"
	kubectl --kubeconfig=$HOME/.kube/$1 exec -it $podname -- bash
    fi
}

function kb() {
    kubectl --kubeconfig=$HOME/.kube/$1 ${@:2};
}

function decode() {
    echo $1 | base64 --decode
}

function encode() {
  echo -n $1 | base64
}
