def llm(client, text, system_prompt, format):
    response = client.beta.chat.completions.parse(
        model="gpt-4o-mini",
        messages=[{
            "role": "system",
            "content": system_prompt
        }, {
            "role": "user",
            "content": text
        }],
        response_format=format
    )
    return response.choices[0].message.content