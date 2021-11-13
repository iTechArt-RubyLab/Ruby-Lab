# frozen_string_literal: true

def mean(town, st)
  p town
  n=0.0
 if (st.include? town)
   s = st.split("\n")
  for i in s
    if (i.include?town)
    m = i.split(",")
   for k in m
    l = k.scan(/\d*\.\d/).map(&:to_f)
    for j in l
     n +=j
    end
   end
      break
    end
   end
    n / 12
   else
   -1.0
   end
end
def variance(town, st)
 p town
 nn=0.0
hg=0.0
 if (st.include? town)
 s = st.split("\n")
  for i in s
     if (i.include?town)

     m = i.split(",")

    for k in m

     l = k.scan(/\d*\.\d/).map(&:to_f)

     for j in l
hg += (mean(town,st) - j)**2
      nn = 0.0
     end
    end
       
      break
       else
     end
    end
   hg / 12
 else
 
      -1.0
 end
end