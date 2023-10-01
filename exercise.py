import os

output = ""
count = 1

t = {
    "b": "Barbell",
    "bw": "Bodyweight",
    "c": "Cable",
    "d": "Dumbbell",
    "m": "Machine",
    "mi": "Misc",
}

m = {
    "1": "Abs",
    "2": "Back",
    "3": "Biceps",
    "4": "Calves",
    "5": "Chest",
    "6": "Forearms",
    "7": "Glutes",
    "8": "Hamstrings",
    "9": "Neck",
    "10": "Quads",
    "11": "Shoulders",
    "12": "Triceps",
}

while True:
    os.system("clear")
    
    print(f"#{count}")

    na = input("na:   ")

    if na == "!":
        break
    elif na == "?":
        continue

    ty = input("ty:   ")

    if ty == "?":
        continue

    mu = input("mu:   ")

    if mu == "?":
        continue

    
    
    na = na.strip().title()
    ty = t[ty].strip().title()
    mu = m[mu].strip().title()

    output += "{"  + "\n"
    output += f"  'name':'{na}'," + "\n"
    output += f"  'type':'{ty}'," + "\n"
    output += f"  'muscle':'{mu}'," + "\n"
    output += "" + "\n"
    output += "  'prev_sets':[]," + "\n"
    output += "  'prev_warmup':[]," + "\n"
    output += "  'prev_drops':[]," + "\n"
    output += "" + "\n"
    output += "  'total_reps':0," + "\n"
    output += "  'total_volume':0," + "\n"
    output += "" + "\n"
    output += "  'max_weight':0," + "\n"
    output += "  'max_onerepmax':0," + "\n"
    output += "" + "\n"
    output += "  'description':''," + "\n"
    output += "}," + "\n"

    count += 1

os.system("clear")
print(output)