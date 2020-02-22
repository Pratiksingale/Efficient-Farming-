import java.util.Arrays;

class Array
  {


  	  public static void main(String[] args)
  	   {
  	  	    int[]arr={1,2,3,4,5};
  	  	    int[]res=rev(arr);

  	  	    System.out.println("orginal "+ Arrays.toString(arr));
  	  	    System.out.println("Rev"+ Arrays.toString(res));

  	  }

  	  static int[] rev(int [] a)
  	    {
  	    	  int[]b=new int [a.length];
  	    	  for(int i=a.length-1,j=0;i>=0;i--,j++)
  	    	  {
  	    	  	b[j]=a[i];

  	    	  }
  	    	  return b;


  	      }
  }
