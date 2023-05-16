import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os
import japanize_matplotlib

target_path = os.path.join(os.path.dirname(__file__), '../newton_method_2.csv')
#print(target_path)
df=pd.read_csv(target_path, names=('value', 'error'))
print(df)

y1=df.value
x=np.arange(0,len(y1),1)
y3=df.error

title=os.path.splitext(os.path.basename(__file__))[0]
plt.title(title)
plt.plot(x,y1,"o")
plt.xlabel("試行回数")
plt.ylabel("値 ")
plt.savefig(title+'.jpg')
plt.show()