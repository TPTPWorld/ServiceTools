/********************************************************
# Author: Yury Puzis			       
# Started: Spring 2003			       
# Modified: 2/19/04			       
********************************************************/

#include "isodata.h"

CLUSTER::CLUSTER(int _size, int _k, float _seed) {
  BREAKING_POINT = 10.0;
  k = _k;
  size = _size;
  csize = 0;
  values = new CVALUE[_size];  //to be filled in by user
  centers = new CCENTER*[_size+1];
  add_cluster(_seed);
  for (int i = 0; i < size; i++) {
    values[i].center = centers[0];
//    cout << i << ": " << values[i].center->loc << endl;
  }
}

CLUSTER::~CLUSTER() {
  delete [] values;
}

float distance(float a, float b) {
  if (a > b) return (float)(a - b);
  return (float)(b-a);
}

void CLUSTER::print() {
  for (int i = 0; i < size; i++) {
//	cout << "i: "<< i << " || values[i].loc: " << values[i].loc << " || C:"
//	     << values[i].center->loc << endl;
  }
  cout << "-clusters--------------------------------------------" << endl;
  for (int v = 0; v < csize; v++) {
        cout << v << ": loc: " << centers[v]->loc << " || size: " << 
        centers[v]->size << " || deviation: " << centers[v]->deviation << endl;
  }
  cout << "=====================================================" << endl;
}

void CLUSTER::update_membership() {
  for (int i = 0; i < size; i++) {
    for (int v = 0; v < csize; v++) {
      if (values[i].distance() > ::distance(values[i].loc, centers[v]->loc)) {
 //       cout << "assigning " << i << " to " << centers[v]->loc << endl;
	values[i].center = centers[v];
      }
    }
  }
}

float CLUSTER::update_clusters(){
  for (int v = 0; v < csize; v++) {
    centers[v]->size = 0;
    centers[v]->enumeration = 0;
    centers[v]->loc = 0;
    centers[v]->distance = 0;
    centers[v]->deviation = 0;
  }
  //cout << " % % % " << endl;
  //print ();
  //cout << " % % % " << endl;
  //incrementaly update distance and deviation 
  float TOTAL_DIST = 0;
  for (int i = 0; i < size; i++) {
    values[i].center->loc += values[i].loc;
    values[i].center->size++;
    values[i].center->distance += values[i].distance();
    values[i].center->enumeration++;
    //values[i].center->deviation += 
    //  pow(values[i].center->enumeration - values[i].loc, 2);
    TOTAL_DIST += values[i].distance();
  }
  //recalculate distance to cluster center, and the overall distance (AV_DIST)
  int i = 0;
  for (int v = 0; v < csize; v++) {
    i++;
    if (centers[v]->size > 0) {
      centers[v]->loc /= centers[v]->size;
      centers[v]->distance /= centers[v]->size;
      //cout << "DEVIATION: " << centers[v]->deviation << " size " << centers[v]->size << endl;
    } else {
      //cout << "erasing " << v << " || " << centers[v]->loc << endl;
      erase_cluster(v);
      v--;
      //cout << "shifting " << i << " to " << centers[v]->loc << endl;
      //cout << "ZERO! " << endl;
    }
  }
  for (int i = 0; i < size; i++) {
   values[i].center->deviation += pow(values[i].loc - values[i].center->loc, 2);
  }
  for (int v = 0; v < csize; v++) {
    centers[v]->deviation = sqrt(centers[v]->deviation / centers[v]->size);
  }
  return TOTAL_DIST/size;
}

ACT CLUSTER::try_lumping() {
  if (last_action != _split) {
    if (csize == 0) return _end;
    if (csize == 1) return _nothing;
  }
  update_membership();
  cluster_insertion_sort();
  for (int v = 0; v < csize; v++) {
      centers[v]->enumeration = 0;
  }
  int MAX_MEMBERS = 0;
  for (int v = 0; v < csize-1; v++) {
    if (centers[v]->size > MAX_MEMBERS) MAX_MEMBERS = centers[v]->size;
    if (::distance(centers[v]->loc, centers[v+1]->loc) < MIN_DIST) {
      //cout << "will lump " << v << " and " << v+1 << endl;
      centers[v]->enumeration = 1;
      v++;
    } else {
      centers[v]->enumeration = 0;
    }
  }
  //cout << "MAX MEMBERS " << MAX_MEMBERS << endl;
  int KS;
  if (MAX_MEMBERS < k) KS = MAX_MEMBERS; else KS = k;
  if (KS == 0 && last_action == _split) return _nothing;
  if (KS == 0 && last_action != _split) return _end;
  //cout << "lumping, KS " << KS << endl;
  print();
  int v = 0;
  while (KS > 0 && v < csize-1) {
    if (centers[v]->enumeration == 1) {
	//cout << "actually lumping " << endl;
      KS--;
      centers[v]->loc = (centers[v]->loc + centers[v+1]->loc)/2;
      //for (int i = 0; i < size; i++)
	//if (values[i].center == centers[v]) values[i].center = centers[v+1];
      erase_cluster(v+1);
    } else {
      v++;
    }
  }
  //cout << "after lumping number of clusters:" << csize << endl;
  print();
  return _lump;
}

void CLUSTER::cluster_iso() {
  bool ITER = false;
  int ITER_N = 0;
  float LO_Q = (k+1)/2;
  float HI_Q = 2*k;
  //print();
  while (ITER_N++ < MAX_ITER) {
    //cout << "< Updating membership >" << endl;
    update_membership();
    //print();
    //cout << "< Updating clusters >" << endl;
    float AV_DIST = update_clusters();
    //print();
    if (csize < LO_Q || (csize < HI_Q && ITER)) {
      int u = csize;
      //cout << "< Number of clusters: " << csize << " >" << endl;
      for (int v = 0; u-- > 0; v++) {      
	if (centers[v]->deviation > BREAKING_POINT) {
	  if(LO_Q > csize || 
	     (centers[v]->distance > AV_DIST && centers[v]->size > 2*MIN_SIZE)){
            //cout << "splitting " << centers[v]->loc << endl;
            centers[add_cluster(centers[v]->loc + 0.01)]->size = 0;
	    centers[v]->loc -= 0.01;
	    last_action = _split;
	  } else {
	    if (ITER_N > 1) {
	      if (last_action != _lump) {
		last_action = try_lumping();
	      } else {
		if (csize == 0) break; else continue;
	      }
	    } else {
	      last_action = try_lumping();
	    }	
	  }
	}
      }      
    } else {
      last_action = try_lumping();
    }
    ITER = 1 - ITER;
  } 
}

void CLUSTER::cluster_iso2() {
  if (one_to_one()) return;
  bool ITER = false;
  unsigned int ITER_N = 0;
  float LO_Q = (k+1)/2;
  float HI_Q = 2*k;
  int last = 0;
  //int last_csize = -1;
  //print();
  last_action = _split;
  while (last < 4) {
 //   cout << "LOOP " << ITER_N << endl;
    last_action = _nothing;
    //cout << "< Updating membership >" << endl;
    update_membership();
    //cout << "< Updating clusters >" << endl;
    float AV_DIST = update_clusters();
    //print();
    //print();
    if (csize < HI_Q) {
      int u = csize;
      //cout << "< Number of clusters: " << csize << " >" << endl;
      for (int v = 0; u-- > 0; v++) {      
	if (centers[v]->deviation > BREAKING_POINT) {
//	  if(LO_Q > csize || 
//	     (centers[v]->distance > AV_DIST && centers[v]->size > 2*MIN_SIZE)){
           //cout << "splitting " << centers[v]->loc << " BR " << BREAKING_POINT << endl;
            centers[add_cluster(centers[v]->loc + 0.0001)]->size = 0;
	    centers[v]->loc -= 0.00001;
	    last = 0;
//	  }
	}
      }      
    }
    ITER = 1 - ITER;
    last++;
    if (last == 4 && csize < k) {
      float OBP = BREAKING_POINT;
      float DV = 0;
      //find average deviation and set BREAKING_POINT to it
      for (int v = 0; v < csize; v++) DV += centers[v]->deviation;
      DV /= csize;
      //make a little smaller then average to be able break a single cluster
      BREAKING_POINT = DV-0.0000001;
      //cout << "adjusting BREAKING_POINT " << BREAKING_POINT <<  endl;
      //take another shot _only_ if this is the first time this BP is used
      if (OBP != BREAKING_POINT) last = 0;
      //there are no divisible clusters, quit
      if (DV == 0) last = 4;
    }
    ITER_N++;
//    cout << "turn " << ITER_N << endl;
  } 
  if (csize < k) {
    //divide largest clusters in 2 ?
  }
  if (csize > k) {
    int EXTRA = csize - k;
    while (EXTRA > 0) {
      update_membership();
      update_clusters();
      cluster_insertion_sort();
      float s = ::distance(centers[0]->loc, centers[1]->loc); // * 
		//  (centers[0]->size + centers[1]->size);
      int l = 0;
      for (int v = 1; v < csize-1; v++) {
        float m = ::distance(centers[v]->loc, centers[v+1]->loc);
        if (m  < s) {
          s = m;
	  l = v;
 	}
      }
      EXTRA--;
      centers[l]->loc = (centers[l]->loc + centers[l+1]->loc)/2;
      erase_cluster(l+1);
    }
  }
  update_membership();
  update_clusters();

}

void CLUSTER::cluster_k() {

}

bool CLUSTER::one_to_one() {
  //check if there are less or same number of values then number of desired cl.
  int distinct_values = size;
  for (int i = 0; i < size; i++) {
     for (int j = i - 1; j >= 0; j--) {
        if (values[i].loc == values[j].loc) {
	   distinct_values--;
	   break;
        }
     }
  }
  //there are more distinct values then desired # of clusters
  if (distinct_values > k) return false;
  //there are less or equal distinct values then desired # of clusters
  bool distinct;
  for (int i = 0; i < size; i++) {
     distinct = true;
     for (int j = i - 1; j >= 0; j--) {
        if (values[i].loc == values[j].loc) {
	   distinct = false;
           values[i].center = values[j].center;
	   break;
        }
     }
     if (distinct) values[i].center = centers[add_cluster(values[i].loc)];
  } 
  return true;
}

void CLUSTER::cluster_insertion_sort() {
  int j;
  float index;
  CCENTER* center;
  for (int i = 1; i < csize; i++) {
    index = centers[i]->loc;
    center = centers[i];
    j = i;
    while (j > 0 && centers[j-1]->loc > index) centers[j] = centers[--j];
    centers[j] = center;
  }
}

/* buggy
void CLUSTER::value_insertion_sort() {
  int j;
  float index;
  for (int i = 0; i < size; i++) {
    index = values[i];
    j = i;
    while (j > 0 && values[j-1] > index) values[j] = values[--j];
    values[j] = index;
  }
}
*/

int CLUSTER::enumerate() {
  cluster_insertion_sort();
  //assign each cluster serial number
  int p = 1;
  for (int v = 0; v < csize; v++) centers[v]->enumeration = p++;
  return csize;
}
