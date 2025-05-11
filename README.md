# BLoC Architecture in Flutter  

BLoC (Business Logic Component) ensures predictable state management by separating UI and logic. This approach enhances maintainability and scalability in Flutter applications.  


## 🔥 Understanding BLoC  

BLoC manages state reactively, responding to events and updating the UI accordingly.  

### 📌 **1. Events**  
Events represent actions or triggers in the app that originate from the UI, such as:  

- Pressing a button  
- Typing in a text field  
- Pull-to-refresh actions  

### 📌 **2. States**  
States represent the **result or outcome** on the UI after an event occurs.  

#### Types of States:  
1️⃣ **LoadingState** – The app is waiting for data to load.  
2️⃣ **LoadedState** – Data has been successfully fetched and displayed.  
3️⃣ **ErrorState** – An issue occurred (e.g., no internet, incorrect input).  

### 📌 **3. BLoC (Business Logic Component)**  
BLoC acts as a bridge between **events** and **states**. It listens to events, processes them, fetches data from APIs or databases, and emits appropriate states.  

---

## 🚀 Summary  

1️⃣ **User interacts with UI → Event triggered**  
2️⃣ **BLoC processes the event → Fetches or processes data**  
3️⃣ **State updates → UI reflects changes**  

# AI Processing Flow 

## Overview
This describes the process flow of AI message handling in theapplication.

## Process Flow

1. User input is captured as a `ChatGenerateMessage` event.
2. The event triggers `AiBloc`, which processes the input.
3. `AiBloc` updates the UI state by emitting `ChatSuccessState`.
4. The user message is formatted into an `AiMessageModel` by `AiBloc`.
5. The formatted message is sent to `AiRepo` for AI processing.
6. The AI API response is received by `AiBloc`.
7. `AiBloc` updates the state, triggering a UI rebuild to display the AI response.

## Notes
- `AiBloc` is responsible for managing state transitions.
- `AiRepo` handles API interactions and processes the AI response.
- The UI listens for state changes and updates accordingly.

https://github.com/user-attachments/assets/6c747921-6cd0-45b2-9098-9ada35a03d12
