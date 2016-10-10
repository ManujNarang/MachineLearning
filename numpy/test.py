import numpy as np 

a=np.arange(6).reshape(2,3)
b=np.array([[1,2,3],[4,5,6]])
c=np.arange(8).reshape(4,2)
Sprint (a.shape)#check the shape of the array
print (b.shape)
print (a*b)
print(c.dot(b))

# basic array functions and operations.
print b.sum()
print b.min()
print b.max()
print b.min(axis=0)#axis->0 corresponds to column wise
print b.max(axis=1)
print b.cumsum(axis=0)#cumulative sum while moving across a column
 
ar=np.array([0,1,2])
print np.exp(ar)
print np.sqrt(ar)

#slicing and indeing

d=np.arange(10)**3
d[:6:2]=-1 # starting from the 0th index every second element=-1
d[::-1] #reversed array d

print(d[0:1,1])
print(d[:,:])

print(d[-1]) #last row ~ b[-1,:]
# while reshaping the array giving 
#-1 as the arguement calculates other dim automatially
