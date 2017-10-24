 
 //import java.math;
 
 // Numbers are very big for this.
 // Better do this in SageMath, for example.
 
 void settings () {
   
 }
 
 void setup () {
   println (str (prob_passesIfStudies (69, 72, 4)));
 }
 
 void draw () {
   
 }
 
 //public BigInteger factorial (int n) {
 public int factorial (n) {
   if (n == 0) return 1;
   return n*factorial (n-1);
 }
 
 public int comb (int n, int m) {
   if (n >= 0 && m >=0) {
     if (n >= m) {
       if (factorial (m)*factorial (n-m) == 0) {
         println ("0 in " + str (n) + ", " + str (m));
         println ("because fac (" + str (n-m) + ") = " + factorial(n-m));
         return 1;
       }
       return factorial (n)/(factorial (m)*factorial (n-m));
     } else {
       println ("Bad input on combinations.");
       return 1;
     }
   } else {
     println ("Negative input on comb (n, m).");
     return 1;
   }
 }
 
 public float hypergeometric (int x, int N, int n, int N0) {
   if (x >= 0 && N > 0 && n > 0 && N0 > 0 && N > N0 && n < N) {
     return (comb (N0, x)*comb (N-N0, n-x))/float (comb (N, n));
   } else {
     println ("Bad input on hypergeometric distribution.");
     return 0;
   }
 }
 
 public float prob_passesIfStudies (int studied, int totalLessons, int lessonsAsked) {
   if (studied > 0 && totalLessons > 0 && lessonsAsked > 0 &&
   totalLessons >= lessonsAsked && studied <= totalLessons) {
     float r = 0;
     for (int i = 1; i <= lessonsAsked; i++) {
       float t = hypergeometric (i, totalLessons, lessonsAsked, studied);
       r += t;
     }
     return r;
   } else {
     println ("Bad input on passesIfStudied.");
     return 0;
   }
 }