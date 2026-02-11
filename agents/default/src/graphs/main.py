from typing import TypedDict
from langgraph.graph import StateGraph, START, END


class State(TypedDict):
    """Graph state."""
    input: str
    output: str


def process_node(state: State) -> State:
    """Example node that processes input."""
    return {"output": f"Processed: {state['input']}"}


# Build graph
workflow = StateGraph(State)
workflow.add_node("process", process_node)
workflow.add_edge(START, "process")
workflow.add_edge("process", END)

# Compile for deployment
graph = workflow.compile()