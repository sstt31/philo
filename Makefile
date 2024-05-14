NAME = philo

CC = gcc

FLAGS = -g -pthread -Wall -Wextra -Werror

SRCS = $(wildcard *.c)

OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(SRCS)
	$(CC) $(FLAGS) -o $(NAME) $(SRCS) 

clean:
	rm -f $(OBJS)

fclean:
	rm -f $(NAME)
play:
	valgrind --leak-check=full --show-leak-kinds=all ./$(NAME) 4 210 100 100 2

hell:
	valgrind --tool=helgrind ./$(NAME) 5 800 200 200

re: fclean all

.PHONY: all, re, clean, fclean