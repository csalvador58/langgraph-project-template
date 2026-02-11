import os
from typing import TypedDict
from langchain_openai import ChatOpenAI
from langgraph.graph import StateGraph, START, END


class State(TypedDict):
    """Graph state."""
    input: str
    output: str


# Configure LM Studio model
# Make sure LM Studio is running and a model is loaded
llm = ChatOpenAI(
    base_url=os.getenv("LM_STUDIO_BASE_URL", "http://localhost:1234/v1"),
    api_key=os.getenv("LM_STUDIO_API_KEY", "lm-studio"),
    model=os.getenv("LM_STUDIO_MODEL_NAME", "local-model"),
    temperature=0.7,
)


def process_node(state: State) -> State:
    """Example node that processes input using LM Studio."""
    messages = [
        ("system", "You are a helpful assistant."),
        ("human", state["input"]),
    ]
    
    response = llm.invoke(messages)
    return {"output": response.content}


# Build graph
workflow = StateGraph(State)
workflow.add_node("process", process_node)
workflow.add_edge(START, "process")
workflow.add_edge("process", END)

# Compile for deployment
graph = workflow.compile()