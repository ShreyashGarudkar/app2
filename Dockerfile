FROM 192.168.0.52:5000/python
WORKDIR /src
COPY . .
EXPOSE 4000
RUN pip install -r requirement.txt
CMD ["python", "server.py"]
