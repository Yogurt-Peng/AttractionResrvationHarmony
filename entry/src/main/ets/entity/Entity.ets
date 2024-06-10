

export class Attraction{
  public  aid:number
  public name:string
  public location:string
  public description:string
  public openingHours:string
  public image:string
  public price:number

  constructor(aId: number, name: string, location: string, description: string, openingHours: string,  image: string, price: number) {
    this.aid = aId;
    this.name = name;
    this.location = location;
    this.description = description;
    this.openingHours = openingHours;
    this.image = image;
    this.price = price;
  }

  // 添加toString方法
  toString(): string {
    return `Attraction { aId: ${this.aid}, name: ${this.name}, location: ${this.location}, description: ${this.description}, openingHours: ${this.openingHours},  image: ${this.image}, price: ${this.price} }`;
  }
}

export interface ApiResponse {
  code: number;
  message: string;
  data: any[];
}


export class  Operation{
  public oId:Number
  public aId:Number
  public name:string
  public description:string
  public openingHours:string
  public image:string
  public price:Number

  constructor(oId:number,aId: number, name: string, description: string, openingHours: string,  image: string, price: number) {
    this.oId = oId;
    this.aId = aId;
    this.name = name;
    this.description = description;
    this.openingHours = openingHours;
    this.image = image;
    this.price = price;
  }

  public toString(): string {
    return `Operation Details:
    oId: ${this.oId}
    aId: ${this.aId}
    Name: ${this.name}
    Description: ${this.description}
    Opening Hours: ${this.openingHours}
    Image: ${this.image}
    Price: ${this.price}`;
  }

}

