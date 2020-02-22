class ArrayAddition {
 public static void main(String[] args) {
 	int[] arr = new int[args.length];
 	for(int i=0; i<args.length;i++) {
 		arr[i] = Integer.parseInt(args[i]);
 	}
 	int result = getSumOfArray(arr);
 	System.out.println("Result is:" + result);
 }
 static int getSumOfArray(int[] input) {
 	int sum = 0;
 	for(int d: input) {
 		//if(d%2 != 0) {
 			sum = sum + d;
 		//}
 	}
 	return sum;
 }
}
//java ArrayAddition 1 2 3 4 5





