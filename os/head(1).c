#include "types.h"
#include "stat.h"
#include "user.h"

char buf[512];

void
head(int fd, char *name, int linenum)
{
  int i, n, l;
  l = i = 0;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  {
    for(i=0; i<n; i++)
    {
      if(buf[i] == '\n'){
	printf(1, "\n");
        l++;}
      else{
	printf(1, "%c", buf[i]);
	}
      if(l == linenum){
	printf(1, "\n");
	exit();
	}
     }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{
  int fd;
  int n=10;
  if(argc <= 1){
    head(0, "", 10);
  }
  else if(argc == 2){
    fd = open(argv[1],0);
    head(fd, "", 10);
  }
  else {

  n = atoi(++argv[1]);
 // printf(1, "n= %d\n",n);
  fd = open(argv[2],0);
  head(fd, "", n);
}
  close(fd);
  //for(i = 1; i < argc; i++){
   // t=*argv[i];
   // printf(1,"num: %s",t);
    //if (t == '-'){
      // argv[i]++;
      // printf(1,"kkk\n");
       //n = atoi(argv[i]++);
       //printf(1,"n = %d",n);
    //} 
    //else(fd = open(argv[i], 0)) < 0){
      //printf(1, "head: cannot open %s\n", argv[i]);
      //exit();
   // }
   //printf(1,"filename: %s\n", *argv[i]);
  // head(fd, argv[i], n);
    //close(fd);
  //}
  exit();
}
