import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os
import japanize_matplotlib

target_path = os.path.join(os.path.dirname(__file__), '../bisection_method_1.csv')
#print(target_path)
df_bisection_method1=pd.read_csv(target_path, names=('low', 'high', 'error'))
print(df_bisection_method1)

y1=df_bisection_method1.low
x=np.arange(0,len(y1),1)
y2=df_bisection_method1.high
y3=df_bisection_method1.error

title=os.path.splitext(os.path.basename(__file__))[0]
plt.title(title)
plt.plot(x,y1,"o")
plt.plot(x,y2,"^")
plt.xlabel("試行回数")
plt.ylabel("値 ")
plt.savefig(title+'.jpg')
plt.show()

