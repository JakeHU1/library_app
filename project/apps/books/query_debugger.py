from django.db import connection, reset_queries
import time
import functools


def query_debugger(func):
    @functools.wraps(func)
    def inner_func(*args, **kwargs):

        reset_queries()

        start_queries = len(connection.queries)

        start = time.perf_counter()
        result = func(*args, **kwargs)
        end = time.perf_counter()
        query_info = connection.queries
        end_queries = len(connection.queries)

        print(f"Function : {func.__name__}")
        print(f"Number of Queries : {end_queries - start_queries}")
        queries = ["{}\n".format(query["sql"]) for query in query_info]
        print(f"Finished in : {(end - start):.2f}s")
        print("queries: \n{}".format("".join(queries)))
        return result

    return inner_func
