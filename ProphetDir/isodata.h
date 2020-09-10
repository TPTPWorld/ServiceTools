/********************************************************
# Author: Yury Puzis			       
# Started: Spring 2003			       
# Modified: 2/19/04			       
********************************************************/

#ifndef __ISO_CLUSTERING__
#define __ISO_CLUSTERING__

#include <math.h>
#include <iostream>

using namespace std;

#define MAX_ITER 20
#define MIN_SIZE 1
#define MIN_DIST 0.02

enum ACT {
  _split,
  _lump,
  _nothing,
  _end
};

struct CCENTER {
  float loc;		//position of the cluster's center
  int size;		//size of cluster
  float distance;	//avarage distance of all cluster members
  float deviation;	//standard deviation
  int enumeration;	//used for various purposes

  bool operator<(CCENTER *p) {
    if (loc < p->loc) return true;
    return false;
  }
};

struct CVALUE {
  float loc;
  CCENTER* center;
  
  float distance() {
    float answer = center->loc - loc;
    if (answer > 0) return answer;
    return -answer;
  } 
};

class CLUSTER {
  private:
    CCENTER** centers;
    int size;		//number of values
    int k;		//desired number of clusters
    ACT last_action;
    int csize;
    float BREAKING_POINT;

    void  cluster_insertion_sort();
    float update_clusters();
    ACT   try_lumping();
    //returns index of the new center
    int   add_cluster(float loc) {
  		centers[csize] = new CCENTER;
  		centers[csize++]->loc = loc;
  		return csize-1;
    }
    void  erase_cluster(int i) { 
        csize--;
	centers[i] = centers[csize]; 
    }
    
  public:
    CVALUE* values;	//array of all the values

    CLUSTER(int _size, int _k, float _seed);
    ~CLUSTER();

    //seed centers by reduction of digits after decimal point
    void	seed_decimal	(int klusters);
    
    //create one center
    void	seed_fixed	(float cent);

    //cluster using isodata algorithm
    void	cluster_iso	();
    void	cluster_iso2	();

    //cluster using regular k-means algorithm
    void	cluster_k	();

    //used to map cluster centers to integer values
    int	 	enumerate	();

    //empty all data, prepare to work from scratch
    void 	print		();
    void  	update_membership();

    //check if there are less or same number of values then # of desired clust.
    //if yes, create the clusters directly, and return true
    bool 	one_to_one	();
};

#endif
