#include <stdio.h>

int function(int b){
    int a, c;
    switch (b){
        case 1: a=b/1;break;
        case 4: c=b-4; a=b/c; break;
    }
    return a;
}

int main(){
    function(4);
}