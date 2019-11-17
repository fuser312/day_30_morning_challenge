import 'dart:math';

// Challenge
// Matryoshka dolls are traditionally wooden dolls that can be nested by fitting
// smaller dolls into larger ones. Suppose arrays can be nested similarly,
// placing smaller arrays into larger ones, in the following sense:
//
//// Array A can be nested inside Array B if:
//// 1. min(array A) > min(array B)
//// 2. max(array A) < max(array B)

//// For example, if A = [2, 3, 9, 5] and B = [10, 2, 1], then A can be nested inside B, since:
////  - min(A) = 2 > 1 = min(B) and
////   - max(A) = 9 < 10 = max(B)

/// Create a function that returns true if every single sub-array inside an array
/// can be nested Matroyshka style, and false otherwise.
///

bool matryoshkaDolls(List<List<int>> dolls){
  dolls.sort((List<int> a, List<int> b) => a.reduce(min).compareTo(b.reduce(min)));
  List <int> mins = dolls.map((List<int>doll)=> doll.reduce(min)).toList();
  if(!isUniqueElements(mins)){
  return false;
  }

  List <int> maxs = dolls.map((List<int>doll)=> doll.reduce(max)).toList();

  if(!isDescendingElements(maxs)){
  return false;
  }
  return true;
}

bool isDescendingElements(List<int>maxs){
  int previous = maxs.first;
  for(int i = 1; i<maxs.length; i++){
    if(previous <= maxs[i]){
      return false;
    }
    previous = maxs[i];
  }
  return true;
}

bool isUniqueElements(List <int> list){
  return list.toSet().length == list.length;
}
main() {
  print(matryoshkaDolls([[2,3,9,5],[10,2,1]]));
}
