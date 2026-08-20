import os

from pydantic_ai import Agent
from pydantic_ai.capabilities import MCP
from pydantic_ai.models.openai import OpenAIResponsesModel
from pydantic_ai.providers.openai import OpenAIProvider
from pydantic_ai_harness import FileSystem

agent = Agent(
    name="hpc-docs-agent",
    model=OpenAIResponsesModel(
        model_name="@vertexai/gemini-3.5-flash",
        provider=OpenAIProvider(
            base_url="https://ai-gateway.apps.cloud.rt.nyu.edu/v1/",
            api_key=os.getenv("PORTKEY_API_KEY"),
        ),
    ),
    instructions="Be concise and answer questions from retreived knowledge with tools.",
    capabilities=[
        MCP(
            url="https://mcp-gateway.apps.cloud.rt.nyu.edu/socrata-mcp/mcp",
            id="socrata-mcp",
            headers={
                "x-portkey-api-key": os.getenv("PORTKEY_API_KEY"),
            },
        ),
        MCP(
            url="https://mcp-gateway.apps.cloud.rt.nyu.edu/flint-mcp/mcp",
            id="flint-mcp",
            headers={
                "x-portkey-api-key": os.getenv("PORTKEY_API_KEY"),
            },
        ),
        FileSystem(),  # need this to be able to save plots as files in this directory!
    ],
)

app = agent.to_web()
