import { IsString } from 'class-validator'

export class CreateTeacherDto {
	@IsString()
	fio: string
}
