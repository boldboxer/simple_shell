#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define MAX_CMD_LENGTH 100

/**
 * main - entry point
 *
 * Return: 0 on success, 1 on error
 */
int main(void)
{
	char cmd[MAX_CMD_LENGTH];

	while (1)
	{
		printf("simple_shell$ ");

		if (fgets(cmd, MAX_CMD_LENGTH, stdin) == NULL)
		{
			printf("\n");
			break;
		}

		int i = 0;

		while (cmd[i] != '\n')
		{
			i++;
		}
		cmd[i] = '\0';

		int pid = fork();

		if (pid == -1)
		{
			perror("fork failed");
			exit(1);
		}
		else if (pid == 0)
		{
			execlp(cmd, cmd, NULL);
			perror("exec failed");
			exit(1);
		}
		else
		{
			int status;
			wait(&status);
		}
	}
	return (0);
}

