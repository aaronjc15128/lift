import os

exercises = []
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

    exercises.append({"name": na, "type":ty, "muscle": mu})

    count += 1

os.system("clear")
print(exercises)    