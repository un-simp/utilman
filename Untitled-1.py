# importing tkinter module
from tkinter import *
from tkinter import ttk, filedialog
from tkinter.filedialog import askopenfile
# creating tkinter window
root = Tk()
root.title("Utilman Launcher")
root.geometry('400x200')

# Create label
l = Label(root, text = "Utilman Launcher")
l.pack()
ent1=Entry(root,font=40)
ent1.grid(row=2,column=2)
def browsefunc():
    
    filename = askopenfilename
    ent1.insert(END, filename) # add this

    b1=Button(root,text="DEM",font=40,command=browsefunc)
    b1.grid(row=2,column=4)

# This button will initialize
# the open app
Button(root, text = 'launch app', command = open_file).pack(pady = 10)
  
# infinite loop
mainloop()
