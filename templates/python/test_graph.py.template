from graphs.main import graph


def test_graph_runs():
    """Test that graph executes successfully."""
    result = graph.invoke({"input": "hello"})
    assert "output" in result
    assert "Processed: hello" in result["output"]