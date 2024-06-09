

export class Attraction{
  public  aId:number
  public name:string
  public location:string
  public description:string
  public openingHours:string
  public image:string
  public price:number

  constructor(aId: number, name: string, location: string, description: string, openingHours: string,  image: string, price: number) {
    this.aId = aId;
    this.name = name;
    this.location = location;
    this.description = description;
    this.openingHours = openingHours;
    this.image = image;
    this.price = price;
  }

  // 添加toString方法
  toString(): string {
    return `Attraction { aId: ${this.aId}, name: ${this.name}, location: ${this.location}, description: ${this.description}, openingHours: ${this.openingHours},  image: ${this.image}, price: ${this.price} }`;
  }
}

export interface ApiResponse {
  code: number;
  message: string;
  data: any[];
}