#  Agent-Based Model to Investigate how Environmental Temperature Affects the Duration and Frequency of Emperor Penguin Huddles <br/>
The basic ecolab code have been provided by Dawn C Walker in COM3001 Modelling and Simulation of Natural Systems<br/>

## Scope of functionalities 
This model is intended to investigate how environment temperature affect the penguin huddle. The environment temperature, numbers of penguins and the area of environment are input paramter for this model.

## Usage
To run modified model:<br/>

```
ecolab(size,np,nsteps,temperature,fmode,outImages)
```
size = The size of environment<br/> 
np = The number of penguins<br/> 
nsteps = The numbers of iteration<br/> 
temperature = The value of environment temperature<br/> 
fmode = True/False of fast mode<br/> 
outImages = True/False of out image mode)

For instance,
```
ecolab(100,10,200,-20,true,true)
```
It will generate the 100 square kilometer environment with 10 penguins. The iteration will process 200 times and environment is -20 degree. It will output image automaticlly and Fast mode is used.<br/>
It will generate three line charts as this image shown below.<br/> 
The first line chart show the numbers of penguins huddle with iteration.<br/> 
The second line chart show whether penguin huddle or not with iteration.<br/> 
The third line chart show the average temperature of penguins with iteration.<br/> 
![image1](https://user-images.githubusercontent.com/57352059/112484114-9f3ae980-8db4-11eb-8569-74a7e36ea0ad.png)

Here is the result at the start and end stage.<br/>
![image2](https://user-images.githubusercontent.com/57352059/112485110-87179a00-8db5-11eb-9aa6-411e1ea2d754.png)

## Supplementary Materials:
A video of a model runthrough can be found at the following link: https://www.youtube.com/watch?v=ivfYs57Rriw

## Acknowledgements
Thanks for Dawn C Walker provided the ecolab code to support us investigate agent-based model.
