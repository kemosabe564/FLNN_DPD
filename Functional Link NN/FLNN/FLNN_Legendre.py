## Legendre

import numpy as np
import os
import scipy.io


def MemoryPolynomial(uBB, M, P):
    i=0
    U = np.zeros((len(uBB), (M+1)*(P+1)), dtype=complex)
    for m in range(0, M+1):
        for p in range(0, P+1):
            # U[:, i] = np.ones((len(uBB)), dtype=complex)
            # a = (np.roll(uBB,m)*pow(abs(np.roll(uBB,m)),p))
            U[:, [i]] = (np.roll(uBB,m)*pow(abs(np.roll(uBB,m)),p))
            # print(a.shape)
            # print(U[:, [i]].shape)
            i = i+1
    return U

## loading data
Iter = 0
mat = scipy.io.loadmat('SampleData/18_Nov_2021_11_31_16_+0100_itersdata.mat')
variables_name = ['Efficiency', 'ACPR', 'Power', 'NMSE', 'EVM', 'uBB_CFR', 'uBB', 'yBB', 'xBB' , 'y_simb']
input_data = [mat['itersdata'][0]['Efficiency'],
              mat['itersdata'][0]['ACPR'],
              mat['itersdata'][0]['Power'],
              mat['itersdata'][0]['NMSE'],
              mat['itersdata'][0]['EVM'],
              mat['itersdata'][0]['uBB_CFR'],
              mat['itersdata'][0]['uBB'],
              mat['itersdata'][0]['yBB'],
              mat['itersdata'][0]['xBB'],
              mat['itersdata'][0]['y_simb']
              ]
item = zip(variables_name, input_data)
d = dict(item)
create_var = locals()
create_var.update(d)

# print(ACPR[0][0][1])
# print(len(uBB[Iter]))
# print(uBB[Iter])
# print(abs(uBB[Iter][0]))
U = MemoryPolynomial(uBB[Iter], 5, 3)
# print(U)
# print(U.shape)


# U1 = np.linalg.pinv(U)
w = np.dot(np.linalg.pinv(U), yBB[Iter])
# print(w.shape)
# print(w)


yest = np.dot(U, w)
print(yest.shape)
print(yest)


## try to 