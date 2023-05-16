import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os
import japanize_matplotlib

target_path = os.path.join(os.path.dirname(__file__), '../newton_revised_result_and_stepnuber.csv')
#print(target_path)
df=pd.read_csv(target_path, names=('result', 'numberofsteps'))
print(df)

y1=df.result
y2=df.numberofsteps
x=np.geomspace(0.000001,0.1,num=6)
print(x)


title=os.path.splitext(os.path.basename(__file__))[0]
plt.title(title)

plt.plot(x,y1,"o")
plt.xscale('log')
plt.xlabel("dx")
plt.ylabel("result")
plt.savefig(title+'result.jpg')
plt.show()

plt.plot(x,y2,"o")
plt.xscale('log')
plt.xlabel("dx")
plt.ylabel("number of steps")
plt.savefig(title+'numberofsteps.jpg')
plt.show()