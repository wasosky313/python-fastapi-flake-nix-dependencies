#!/usr/bin/env python3

from fastapi import FastAPI

app = FastAPI()

@app.get("/liveness")
async def liveness():
    return {"alive": True}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
